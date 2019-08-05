import * as React from 'react'
import ReactMarkdown from 'react-markdown/with-html'
import emojione from 'emojione'

const HalfCard = (props) =>
  <div className="half-card card">
    <div className="card-title">{props.title}</div>
    <i className={"fas card-icon " + props.type.icon}></i>
    <ReactMarkdown 
      className="blurb" 
      escapeHtml={false}
      source={emojione.shortnameToUnicode(props.blurb)} />
  </div>;

export default HalfCard;