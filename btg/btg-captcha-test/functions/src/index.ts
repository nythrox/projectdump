import express = require("express");
import cors = require("cors");
import * as functions from "firebase-functions";
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const app = express();
app.use(cors());

const request = (url: string) => (
  req: express.Request,
  res: express.Response
) =>
  fetch(url, {
    method: "POST",
    body: JSON.stringify({
      secret: "secret",
      response: req.params.token,
    }),
  })
    .then((res) => res.json())
    .then(res.json);

app.get("/verifyHCaptcha/:token", request("https://hcaptcha.com/siteverify"));

app.get(
  "/verifyGCaptcha/:token",
  request("https://www.google.com/recaptcha/api/siteverify")
);

exports.api = functions.https.onRequest(app);
