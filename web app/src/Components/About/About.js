import React from 'react';
import AboutSvg from './SVG';

const About = () => {
  return (
    <div className="about">
      <div className="main-content">
        <AboutSvg />
        <section className="about-content">
          <div className="profile-img">
            <img
              src="https://cdn.clipart.email/1c0dc2d792b273f08d5d43d370a8e347_batman-head-sketch-by-mike-zeck-in-malvin-vs-the-batman-_863-1224.jpeg"
              alt=""
              srcset=""
            />
          </div>

          <div className="bio">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum quas,
            dolorem atque laborum architecto numquam accusamus cumque optio
            nulla voluptate suscipit quia ipsum ratione! Unde enim ad ducimus
            hic! Consectetur, adipisci velit accusamus quam provident quis
            exercitationem quo doloribus sint perspiciatis ut mollitia
            dignissimos perferendis omnis unde aspernatur reiciendis molestiae,
            sequi fugiat? Sit modi rem placeat magni at incidunt tempora soluta
            vel nulla, sunt ad molestiae repellat, voluptatibus, aspernatur
            ipsam hic quia ducimus aut assumenda amet et nostrum est ab? Dicta
            adipisci obcaecati consequatur aspernatur natus nemo, enim maiores
            quia id at explicabo voluptatibus sunt tempore molestias accusantium
            iure consectetur. Illum fugit cumque illo exercitationem labore modi
            dicta pariatur veniam accusantium omnis natus debitis dolorum culpa
            possimus vel, nesciunt maxime nisi! Laborum incidunt ea unde soluta
            distinctio autem repudiandae voluptatem fugiat commodi! Nobis vitae
            atque tempora exercitationem, facere aperiam, natus soluta saepe
            minima accusamus non beatae sit velit minus libero?
          </div>
        </section>
      </div>
    </div>
  );
};

export default About;
