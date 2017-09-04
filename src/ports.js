const Elm = require('./Main.elm');

const container = document.getElementById('app');
const model = localStorage.getItem('model');
const startingModel = model ? JSON.parse(model) : null;

const app = Elm.Main.embed(container, startingModel);

app.ports.setStorage.subscribe((state) => {
  localStorage.setItem('model', JSON.stringify(state));
});
