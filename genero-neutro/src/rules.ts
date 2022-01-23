import { Just, Maybe, Nothing, pipe } from "purifree-ts";
import { Word } from "./app";

/*
Quando a palavra termina em “-o” no masculino ou “-a” no feminino, substitui a desinência por “-e”.
Exemplos:
* Menino/a. → Menine.
* Todos/as. → Todes.
* Esposo/a. → Espose.
* Obrigado/a. → Obrigade.

*/
const endsWith = (letters: string) => (word: string) => word.endsWith(letters);
const endsWithOneOf = (...letters: string[]) => (word: string) =>
  letters.map((l) => word.endsWith(l)).reduce((prev, curr) => prev || curr);
const replaceLastN = (lastN: number) => (replaceWith: string) => (
  str: string
) =>
  str.length > lastN ? str.substr(0, str.length - lastN) + replaceWith : str;

// Quando a palavra termina em “-o” no masculino ou “-a” no feminino, substitui a desinência por “-e”.
export const terminaEmOA = (word: Word) => {
  const endsWithOA = endsWithOneOf("o", "a");
  if (
    isSingular(word) &&
    hasOpposite(word) &&
    endsWithOA(word.name) &&
    endsWithOA(word.oppositeGender)
  ) {
    return Just(replaceLastN(1)("e")(word.name));
  }
  return Nothing;
};

// Quando a palavra termina em “-co” no masculino e “-ca” no feminino, substitui a desinência por “-que”.
export const terminaEmCoCa = (word: Word) => {
  const endsWithCoCa = endsWithOneOf("co", "ca");
  if (
    isSingular(word) &&
    hasOpposite(word) &&
    endsWithCoCa(word.name) &&
    endsWithCoCa(word.oppositeGender)
  ) {
    return Just(replaceLastN(2)("que")(word.name));
  }
  return Nothing;
};

// Quando a palavra termina em “-go” no masculino e “-ga” no feminino, substitui a desinência por “-gue”.
export const terminaEmGoGa = (word: Word) => {
  console.log(word.name);
  const endsWithGoGa = endsWithOneOf("go", "ga");
  if (
    isSingular(word) &&
    hasOpposite(word) &&
    endsWithGoGa(word.name) &&
    endsWithGoGa(word.oppositeGender)
  ) {
    return Just(replaceLastN(2)("gue")(word.name));
  }
  return Nothing;
};

//Quando a palavra termina em “-r” no masculino e “-ra” no feminino, substitui a desinência por “-rie”.
//Quando no plural, termina em “-res” no masculino e “-ras” no feminino, troca-se a desinência por “-ries”.
export const terminaEmRRaResRas = (word: Word) => {
  if (isMasculine(word) && isSingular(word) && word.name.endsWith("r")) {
    return Just(replaceLastN(1)("rie")(word.name));
  }
  if (isFeminine(word) && isSingular(word) && word.name.endsWith("ra")) {
    return Just(replaceLastN(2)("rie")(word.name));
  }
  if (isPlural(word) && endsWithOneOf("res", "ras")(word.name)) {
    return Just(replaceLastN(3)("ries")(word.name));
  }
  return Nothing;
};

//Quando a palavra termina em “-triz(es)” no feminino e “-r(es)” no masculino, substitui a desinência por “-rie” no singular e “-ries” no plural.
export const terminaEmTrizTrizesRRes = (word: Word) => {
  if (isSingular(word)) {
    if (
      isFeminine(word) &&
      word.name.endsWith("triz") &&
      word.masculino.endsWith("r")
    ) {
      return Just(replaceLastN(4)("rie")(word.name));
    }
    if (
      isMasculine(word) &&
      word.name.endsWith("r") &&
      word.feminino.endsWith("triz")
    ) {
      return Just(replaceLastN(1)("rie")(word.name));
    }
  }
  if (isPlural(word)) {
    if (
      isFeminine(word) &&
      word.name.endsWith("trizes") &&
      word.masculino.endsWith("res")
    ) {
      return Just(replaceLastN(6)("ries")(word.name));
    }
    if (
      isMasculine(word) &&
      word.name.endsWith("res") &&
      word.feminino.endsWith("trizes")
    ) {
      return Just(replaceLastN(3)("ries")(word.name));
    }
  }
  return Nothing;
};

function hasOpposite(word: Word): word is Word & { oppositeGender: string } {
  return !!word.oppositeGender;
}
function isSingular(
  word: Word
): word is Word & { singular: undefined; plural: string } {
  // endswith S pq algumas palavras do dici estão incompletas, e não fala se é plural ou n
  return !word.name.endsWith("s") || Boolean(word.plural);
}
function isPlural(
  word: Word
): word is Word & { singular: string; plural: undefined } {
  // endswith S pq algumas palavras do dici estão incompletas, e não fala se é plural ou n
  return word.name.endsWith("s") || Boolean(word.singular);
}
function isFeminine(
  word: Word
): word is Word & { feminino: undefined; masculino: string } {
  return Boolean(word.masculino);
}
function isMasculine(
  word: Word
): word is Word & { feminino: string; masculino: undefined } {
  return Boolean(word.feminino);
}
