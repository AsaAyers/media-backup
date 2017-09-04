const Elm = require('./Main.elm');

const container = document.getElementById('app');
const model = localStorage.getItem('model');
const startingModel = model ? JSON.parse(model) : null;

function boot() {
  try {
    const app = Elm.Main.embed(container, startingModel);
    app.ports.setStorage.subscribe((state) => {
      localStorage.setItem('model', JSON.stringify(state));
    });
  } catch (e) {
    localStorage.removeItem('model');
    throw new Error('Your model has been reset');
  }
}

boot();
