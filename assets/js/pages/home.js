import * as React from 'react'
import '../../css/clip-card.scss'

const Home = () =>
<div>
  <div className="full-card">
    <img className="thumb-img" src="/images/mayfield.jpg" />
    <img className="desc-img" src="/images/full_card.png" />
    <img className="sash-img" src="/images/sash_card.png" />
    <i className="fas fa-camera-retro card-icon"></i>
    <div className="blurb">
      <div className="blurb-title">Minifield</div>
      <div className="blurb-body">Chris "The Pain Train" Minifield. For paint club November 2018.</div>
    </div>
  </div>
  <div className="half-card">
    <i className="fas fa-gamepad card-icon"></i>
    <div className="blurb">
      <div className="blurb-title">Feliz NaviDEAD</div>
      <div className="blurb-body">Butterscotch Shenanijam 2019 with Alex and Bree Roberts. Theme was CurseMas Eve.</div>
    </div>
  </div>
</div>;

export default Home;