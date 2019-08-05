import * as React from 'react'
import ReactMarkdown from 'react-markdown'
import emojione from 'emojione'

const FullCard = (props) =>
  <div className="full-card card">
    <img className="thumb-img" src={props.thumbnail} />
    <img className="desc-img" src="/images/full_card.png" />
    <img className="sash-img" src="/images/sash_card.png" />
    <div className="card-title">{props.title}</div>
    <i className={"fas card-icon " + props.type.icon}></i>
    <ReactMarkdown 
      className="blurb" 
      escapeHtml={false}
      source={emojione.shortnameToUnicode(props.blurb)} />
  </div>;

export default FullCard;