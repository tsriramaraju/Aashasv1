import React, { useState } from 'react';

import './App.css';
import Navbar from './Components/Navbar/Navbar';
import Home from './Components/home/Home';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Contact from './Components/Contact/Contact';
import Catalog from './Components/catalog/Catalog';
import About from './Components/About/About';
import { Provider } from 'react-redux';
import store from './redux/store';

function App() {
  const [menuActive, setmenuActive] = useState(false);
  const toggleMenu = () => {
    setmenuActive(!menuActive);
  };
  return (
    <Provider store={store}>
      <BrowserRouter>
        <body className={menuActive ? `nav-active` : ``}>
          <Navbar click={toggleMenu} />

          <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/contact" exact component={Contact} />
            <Route path="/catalog" exact component={Catalog} />
            <Route path="/about" exact component={About} />
          </Switch>
        </body>
      </BrowserRouter>
    </Provider>
  );
}

export default App;
