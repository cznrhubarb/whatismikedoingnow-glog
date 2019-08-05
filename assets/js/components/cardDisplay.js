import * as React from 'react'
import gql from 'graphql-tag'
import { Query } from 'react-apollo'
import R from 'ramda'
import Masonry from 'react-masonry-css'
import FullCard from '../components/fullCard'
import HalfCard from '../components/halfCard'

import '../../css/clip-card.scss'
import { maxHeaderSize } from 'http';

const GET_CARDS = gql`
  {
    contentItems {
      id,
      title,
      blurb,
      thumbnail,
      type {
        name,
        icon
      }
    }
  }
`;

class CardDisplay extends React.PureComponent {
  constructor(props) {
    super(props);

    this.state = {
      filter: "none"
    };
  }

  render() {
    return (
      <Query query={GET_CARDS}>
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <>
              <Masonry
                breakpointCols={{default: 4}}
                className="card-grid"
                columnClassName="card-grid-column"
              >
                {
                  theWholeEnchilada(data.contentItems, this.state.filter)
                }
              </Masonry>
            </>
          );
        }}
      </Query>

    );
  }
}

const filter = (items, filter) => 
  filter === "none" 
  ? items 
  : items.filter(item => item.type.name === filter);

const sort = (items) => {
  const numColumns = 4;
  let columnLengths = [2, 2].concat(Array.from({length: numColumns-2}, () => 0));
  let columns = Array.from({ length: numColumns }, () => []);

  items.forEach(item => {
    const cardLength = item.thumbnail ? 2 : 1;
    let minCol = 0;
    for (let i = 1; i < numColumns; i++) {
      if (columnLengths[i] < columnLengths[minCol]) {
        minCol = i;
      }
    }
    columns[minCol].push(item);
    columnLengths[minCol] += cardLength;
  });

  return columns;
}

const rotateTwo = R.pipe(
  R.move(0, -1),
  R.move(0, -1),
);

const interleave = (arrays) => {
  let zipped = [];
  const longest = arrays.reduce((acc, arr) => Math.max(acc, arr.length), 0);
  for (let row = 0; row < longest; row++) {
    zipped.push(arrays.map(arr => arr[row] || { blank: true }));
  }

  return zipped;
}

const map = (items) => items.map((item, idx) =>
  item.blank
    ? <div key={`blank${idx}`} className="card-placeholder"></div>
    : item.thumbnail
      ? <FullCard key={item.id} {...item} />
      : <HalfCard key={item.id} {...item} />
);

const padWithTitle = (items) => [
  <img key="title" src="images/title_card.png" className="title-card card" />,
  <div key="blank" className="card-placeholder"></div>,
].concat(items);

const theWholeEnchilada = R.pipe(
  filter,       // Take out any cards not matching the current filter, or all cards if no filter is set
  sort,         // Sort cards into an array of arrays by height, packing as best as possible
  rotateTwo,    // Rotate twice to account for the title card spaces
  interleave,   // Interleave (zip) arrays to account for how react-masonry-css expects the elements
  R.flatten,    // Flatten
  map,          // Transform the data into the React components
  padWithTitle, // Add the title and blank placeholder to the front of the list
  );

export default CardDisplay;