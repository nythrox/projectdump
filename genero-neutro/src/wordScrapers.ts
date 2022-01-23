import slugify from "slugify";
import { slug, Word } from "./app";

export const addPalavra = (text: string) => (
  word: Partial<Word>
): Partial<Word> => {
  const palavraRegex = /(Significado de).(?<word>.+)/g;
  const palavraMatch = orUndefined(() => text.match(palavraRegex)![0]);
  if (palavraMatch) {
    const [_significado, _de, palavra] = palavraMatch.split(" ");
    return {
      ...word,
      name: palavra.toLowerCase(),
    };
  }
  return word;
};
export const addGenero = (text: string) => (
  word: Partial<Word>
): Partial<Word> => {
  const flexaoGeneroRegex = /(?<generoOposto>Feminino|Masculino):.(?<valorOposto>.+)/g;
  const generoMatch = orUndefined(() => text.match(flexaoGeneroRegex)![0]);
  if (generoMatch) {
    const [generoOposto, generoOpostoValor] = generoMatch
      .replace(": ", "@")
      .split("@");
    return {
      ...word,
      oppositeGender: generoOpostoValor,
      [generoOposto.toLowerCase()]: generoOpostoValor,
    };
  }
  return word;
};
export const addFlexaoNumeral = (text: string) => (
  word: Partial<Word>
): Partial<Word> => {
  const flexaoNumeroRegex = /(?<flexaoNumeroOposto>Plural|Singular):.(?<valorOposto>.+)/g;
  const flexaoNumeralMatch = orUndefined(
    () => text.match(flexaoNumeroRegex)![0]
  );
  if (flexaoNumeralMatch) {
    const [
      flexaoNumeralOposto,
      flexaoNumeralOpostoValor,
    ] = flexaoNumeralMatch.replace(": ", "@").split("@");
    return {
      ...word,
      flexaoNumeral: flexaoNumeralOposto == "Plural" ? "singular" : "plural",
      [flexaoNumeralOposto.toLowerCase()]: flexaoNumeralOpostoValor,
    };
  }
  return word;
};
export const addGramatica = (text: string) => (
  word: Partial<Word>
): Partial<Word> => {
  const gramaticaRegex = /(?<flexaoNumeroOposto>Classe gramatical):.(?<gramatica>.+) (?<genero>.+)/g;
  const gramaticaMatch = orUndefined(() => text.match(gramaticaRegex)![0]);
  if (gramaticaMatch) {
    const [classeGramatical, genero] = gramaticaMatch!
      .split(": ")[1]
      .split(", ");
    return {
      ...word,
      genero: genero ? genero.toLowerCase() : genero,
      classeGramatical: classeGramatical
        ? classeGramatical.toLowerCase()
        : classeGramatical,
    };
  }
  return word;
};

const orUndefined = <R>(f: () => R): R | undefined => {
  try {
    return f();
  } catch (e) {
    return undefined;
  }
};
