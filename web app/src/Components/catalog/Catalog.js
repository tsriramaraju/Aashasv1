import React, { Fragment } from 'react';
import Catalogsvg from './CatalogSVG';
import Productcard from './ProductCard';

const Catalog = () => {
  return (
    <Fragment>
      <div className="catalog-bg-flower">
        <Catalogsvg />
      </div>
      <section className="catalog-content">
        <Productcard />
        <Productcard />
        <Productcard />
        <Productcard />
        <Productcard />
        <Productcard />
        <Productcard />
        <Productcard />
        <Productcard />
        <Productcard />
      </section>
    </Fragment>
  );
};

export default Catalog;
