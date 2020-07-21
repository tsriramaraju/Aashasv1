import React from 'react';

const PageTitle = ({ title, click }) => {
  return (
    <div className="pageTitle" onClick={click}>
      {title}
    </div>
  );
};

export default PageTitle;
