console.clear();

const app = (() => {
  let body;
  let menu;
  let menuItems;

  let contactCard;
  let contactFrontCard;
  let contactBackCard;

  const init = () => {
    body = document.querySelector('body');
    menu = document.querySelector('.menu-icon');
    contactCard = document.querySelector('#contact-card-wrapper');
    contactBackCard = document.querySelector('.contact-card-back');
    contactFrontCard = document.querySelector('.contact-card-front');
    menuItems = document.querySelectorAll('.nav__list-item');

    applyListeners();
  };

  const applyListeners = () => {
    menu.addEventListener('click', () => toggleClass(body, 'nav-active'));
    contactCard.addEventListener('click', () =>
      toggleContact(
        contactBackCard,
        'contact-active-back',
        contactFrontCard,
        'contact-active-front'
      )
    );
  };

  const toggleClass = (element, stringClass) => {
    if (element.classList.contains(stringClass))
      element.classList.remove(stringClass);
    else element.classList.add(stringClass);
  };

  const toggleContact = (element, stringClass, element2, stringClass2) => {
    if (element.classList.contains(stringClass))
      element.classList.remove(stringClass);
    else element.classList.add(stringClass);
    if (element2.classList.contains(stringClass2))
      element2.classList.remove(stringClass2);
    else element2.classList.add(stringClass2);
  };

  init();
})();
