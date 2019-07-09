import * as React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

import Home from './pages/home'
import GameDesign from './pages/gameDesign'

export default class Root extends React.Component {
    render() {
        return (
            <>
            <BrowserRouter>
                <Switch>
                    <Route exact path="/" component={Home} />
                    <Route exact path="/gamedesign" component={GameDesign} />
                </Switch>
            </BrowserRouter>
            </>
        );
    }
}