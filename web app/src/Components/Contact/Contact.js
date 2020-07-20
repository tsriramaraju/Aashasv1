import React, { useState } from 'react';
import Logosvg from './LogoSVG';

const Contact = () => {
  const [cardToggled, setcardToggled] = useState(false);

  const toggle = () => setcardToggled(!cardToggled);

  return (
    <section className={`contact-content}`} onClick={toggle}>
      <div id="contact-card-wrapper">
        <div
          className={`contact-card contact-card-front ${
            cardToggled ? 'contact-active-front' : ''
          }`}
        >
          <Logosvg />
        </div>
        <div
          className={`contact-card contact-card-back ${
            cardToggled ? 'contact-active-back' : ''
          }`}
        >
          <div className="contact-details">
            <h3>JAKE GILES-PHILLIPS</h3>
            <p>FRONT END DEVELOPMENT & WEB DESIGN</p>
            <span>WWW.JAKEGILESPHILLIPS.CO.UK</span>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Contact;
