import React from 'react';

const Productcard = () => {
  return (
    <div className="catalog-card">
      <div className="catalog-card-top">
        <img
          className="catalog-card-img"
          src="https://cdn.clipart.email/1c0dc2d792b273f08d5d43d370a8e347_batman-head-sketch-by-mike-zeck-in-malvin-vs-the-batman-_863-1224.jpeg"
          alt=""
        />

        <div className="catalog-card-img-info">
          <div className="catalog-card-info-inner">
            <span className="catalog-card-p-name">I feel like Pablo</span>
            <span className="catalog-card-p-company">Yeezy</span>
          </div>
          <div className="catalog-card-a-size">
            Available sizes :{' '}
            <span className="catalog-card-size">S , M , L , XL</span>
          </div>
        </div>
      </div>
      <div className="catalog-card-down">
        <div className="catalog-card-h-bg">
          <div className="catalog-card-h-bg-inner"></div>
        </div>

        <a className="catalog-card-cart" href="#">
          <span className="catalog-card-price">$120</span>
          <span className="catalog-card-add-to-cart">
            <span className="catalog-card-txt">View Product </span>
          </span>
        </a>
      </div>
    </div>
  );
};

export default Productcard;
