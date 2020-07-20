import React, { useState, useEffect } from 'react';
import Logosvg from './LogoSVG';
import { connect } from 'react-redux';
import Spinner from '../UI ELements/Spinners';
import { getDesignerData } from '../../redux/actions/designer';
const Contact = ({ loading, profile, getDesignerData }) => {
  useEffect(() => {
    getDesignerData();
  }, []);
  const [cardToggled, setcardToggled] = useState(false);

  const toggle = () => setcardToggled(!cardToggled);

  let jsxComponent;
  if (loading) jsxComponent = <Spinner />;
  else
    jsxComponent = (
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
              <h3>{profile.name}</h3>
              <p>
                377, Road Number 10, Jubilee Hills, Hyderabad, Telangana 500033
              </p>
              <span>{profile.mobile + '  ' + profile.email}</span>
            </div>
          </div>
        </div>
      </section>
    );

  return jsxComponent;
};

const mapStateToProps = (state) => ({
  loading: state.designer.loading,
  profile: state.designer.profile,
});

const mapDispatchToProps = {
  getDesignerData,
};

export default connect(mapStateToProps, mapDispatchToProps)(Contact);
