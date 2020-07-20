import React, { Fragment } from 'react';
import { Link } from 'react-router-dom';
const Navbar = (props) => {
  return (
    <Fragment>
      <div className="menu-icon" onClick={props.click}>
        <span className="menu-icon__line menu-icon__line-left"></span>
        <span className="menu-icon__line"></span>
        <span className="menu-icon__line menu-icon__line-right"></span>
      </div>

      <div className="nav">
        <div className="nav__content">
          <ul className="nav__list">
            <li className="nav__list-item">
              <Link to="/" onClick={props.click}>
                Home
              </Link>
            </li>
            <li className="nav__list-item">
              <Link to="/about" onClick={props.click}>
                About
              </Link>
            </li>
            <li className="nav__list-item">
              <Link to="/catalog" onClick={props.click}>
                catalog
              </Link>
            </li>
            <li className="nav__list-item">
              <Link to="/contact" onClick={props.click}>
                contact
              </Link>
            </li>
          </ul>
        </div>
      </div>
    </Fragment>
  );
};

export default Navbar;
