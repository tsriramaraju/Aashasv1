import React, { Fragment, useEffect } from 'react';
import Catalogsvg from './CatalogSVG';
import Productcard from './ProductCard';
import { connect } from 'react-redux';
import { getProducts } from '../../redux/actions/products';
import Spinner from '../UI ELements/Spinners';

const Catalog = ({ loading, getProducts, products }) => {
  useEffect(() => {
    getProducts();
  }, []);

  let jsxComponent;
  if (loading) jsxComponent = <Spinner />;
  else
    jsxComponent = (
      <Fragment>
        <div className="catalog-bg-flower">
          <Catalogsvg />
        </div>
        <section className="catalog-content">
          {products.map((product, i) => (
            <Productcard
              key={i}
              name={product.title}
              price={product.price}
              size={product.size.join(' ,')}
              img={product.images[0]}
            />
          ))}
        </section>
      </Fragment>
    );

  return jsxComponent;
};

const mapStateToProps = (state) => ({
  products: state.products.products,
  loading: state.products.loading,
});

const mapDispatchToProps = {
  getProducts,
};

export default connect(mapStateToProps, mapDispatchToProps)(Catalog);
