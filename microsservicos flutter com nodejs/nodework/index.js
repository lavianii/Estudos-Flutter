const express = require("express");
const app = express();
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.listen(3001, () => {
  console.log("Conectado na porta 3001 http://localhost:3001/");
});

const productAllData = [];

app.get("/", (req, res) => {
  res.send("Conectado");
});

app.post("/createproduto", (req, res) => {
  console.log("Resultado", req.body);

  const singleProductData = {
    id: productAllData.length + 1,
    pname: req.body.pNome,
    pprice: req.body.pValor,
    pdetails: req.body.pDetalhes,
  };

  productAllData.push(singleProductData);
  res.status(200).send({
    code: 200,
    message: "Product added successfully",
    addedproduct: singleProductData,
  });
});

app.get("/getprodudo", (req, res) => {
  if (productAllData.length > 0) {
    res.status(200).send({ code: "200", productData: productAllData });
  } else {
    res.status(200).send({ code: 200, productData: [] });
  }
});