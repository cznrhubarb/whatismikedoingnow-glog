import "phoenix_html"
import * as React from 'react'
import * as ReactDOM from 'react-dom'
import Root from './root'
import { ApolloProvider } from "react-apollo"
import ApolloClient from 'apollo-boost'

import '../css/app.scss'

const client = new ApolloClient({ uri: '/api/graphiql' });

ReactDOM.render(
  <ApolloProvider client={client}>
    <Root />
  </ApolloProvider>,
  document.getElementById('react-app')
);