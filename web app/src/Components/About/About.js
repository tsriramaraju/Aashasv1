import React, { useEffect } from 'react';
import AboutSvg from './SVG';
import { connect } from 'react-redux';
import Spinner from '../UI ELements/Spinners';
import { getDesignerData } from '../../redux/actions/designer';
const About = ({ loading, profile, getDesignerData }) => {
  useEffect(() => {
    getDesignerData();
  }, []);

  let jsxComponent;
  if (loading) jsxComponent = <Spinner />;
  else
    jsxComponent = (
      <div className="about">
        <div className="main-content">
          <AboutSvg />
          <section className="about-content">
            <div className="profile-img">
              <img src={profile.image} alt="Anitha Kommareddy" />
            </div>

            <div className="bio">{profile.bio}</div>
          </section>
        </div>
      </div>
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

export default connect(mapStateToProps, mapDispatchToProps)(About);
