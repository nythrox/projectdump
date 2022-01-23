import express from "express";
import compression from "compression"; // compresses requests
import bodyParser from "body-parser";
import lusca from "lusca";
import flash from "express-flash";
import puppeteer from "puppeteer";
import slugify from "slugify";
import { Optional } from "express-validator/src/context";
import { match, Maybe, Nothing, pipe } from "purifree-ts";
import {
  addFlexaoNumeral,
  addGenero,
  addGramatica,
  addPalavra,
} from "./wordScrapers";
import {
  terminaEmCoCa,
  terminaEmGoGa,
  terminaEmOA,
  terminaEmRRaResRas,
  terminaEmTrizTrizesRRes,
} from "./rules";
import { result } from "lodash";
console.log("opening pup");
export const browserG = puppeteer.launch({
  headless: true,
});
const app = express();
app.set("port", process.env.PORT || 8080);
app.use(compression());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(flash());
app.use(lusca.xframe("SAMEORIGIN"));
app.use(lusca.xssProtection(true));

export const slug = (w: string) =>
  slugify(w, {
    lower: true,
    locale: "pt-br",
  });

const words: Record<string, Word | undefined> = {};
const wordReplacementFor: Record<string, string> = {
  ele: "elu",
  ela: "elu",
  eles: "elus",
  elas: "elus",

  dele: "delu",
  dela: "delu",
  deles: "delus",
  delas: "delus",

  nele: "nelu",
  nela: "nelu",
  neles: "nelus",
  nelas: "nelus",

  aquele: "aquelu",
  aquela: "aquelu",
  aqueles: "aquelus",
  aquelas: "aquelus",
};

const blacklistedWords: Record<string, string | undefined> = {
  ...wordReplacementFor,
  é: "é",
};

export type Word = {
  name: string;
  classeGramatical: string;
  genero?: string;
  flexaoNumeral?: string;
  masculino?: string;
  feminino?: string;
  plural?: string;
  oppositeGender?: string;
  singular?: string;
};
async function getWord(_originalWord: string): Promise<Word | undefined> {
  const originalWord = _originalWord.toLowerCase();
  async function _getWord(
    lastWord: string,
    tentativa: number
  ): Promise<Word | undefined> {
    const word =
      originalWord.toLowerCase() + (tentativa === 1 ? "" : "-" + tentativa);
    if (blacklistedWords[originalWord]) {
      return undefined;
    }
    if (words[originalWord] && words[originalWord]!.name === lastWord) {
      return words[originalWord];
    }
    const slug = slugify(word);
    const browser = await browserG;
    const url = "https://www.dicio.com.br/" + slug;
    console.log(url);
    const page = await browser.newPage();
    await page.goto(url);
    const notFoundRegex = /Você acessou uma palavra que já não existe ou está procurando uma página que mudou de endereço./g;
    const text = await page.evaluate(
      () => document.querySelector("body")!.innerText
    );
    await page.close();
    if (notFoundRegex.test(text)) {
      blacklistedWords[originalWord] = word;
      return undefined;
    }
    const parsers = [
      addPalavra,
      addGenero,
      addFlexaoNumeral,
      addGramatica,
    ].map((f) => f(text));
    const result = pipe({} as Word, ...(parsers as []));
    words[result.name] = result;
    return await _getWord(result.name, tentativa + 1);
  }
  return await _getWord(originalWord, 1);
}

async function translateWords(words: string[]) {
  const wordInfos = await Promise.all(
    words.map((w) => {
      return getWord(w).then((result) => (console.log(result), result || w));
    })
  );
  return wordInfos.map((word) =>
    typeof word == "string" ? word : translateWord(word)
  );
}

const combineRules = (...rules: ((word: Word) => Maybe<string>)[]) => (
  word: Word
) => {
  return rules.reduce((prev, curr) => {
    return prev.isJust() ? prev : curr(word);
  }, Nothing as Maybe<string>);
};

function translateWord(word: Word) {
  console.log(
    word.name,
    word.name.toLowerCase(),
    wordReplacementFor[word.name.toLowerCase()]
  );
  if (wordReplacementFor[word.name.toLowerCase()]) {
    return wordReplacementFor[word.name];
  }
  return pipe(
    word,
    combineRules(
      terminaEmTrizTrizesRRes,
      terminaEmRRaResRas,
      terminaEmGoGa,
      terminaEmCoCa,
      terminaEmOA
    ),
    match({
      Just: (word) => word,
      Nothing: () => word.name,
    })
  );
}

app.get("/translate", async (req, res) => {
  const words = (req.body.text as string).split(/\s+/);
  res.json({ words: await translateWords(words) });
});

app.get("/:word", async (req, res) => {
  const result = await getWord(req.params.word);
  if (result) res.json(result);
  else res.status(404).send();
});

export default app;
