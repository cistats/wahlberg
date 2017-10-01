import React from 'react'
import { render } from 'react-dom'
import { BrowserRouter, Redirect, Route, Switch } from 'react-router-dom'

import Home from 'pages/Home'
import App from 'containers/App'

const checkAuth = Component => () =>
  window.CURRENT_USER ? (
    <Redirect to="/projects" />
  ) : (
    <Component user={window.CURRENT_USER} />
  )

render(
  <BrowserRouter>
    <Switch>
      <Route exact path="/" render={checkAuth(Home)} />
      <Route
        render={() =>
          window.CURRENT_USER ? (
            <App user={window.CURRENT_USER} />
          ) : (
            <Redirect to="/" />
          )}
      />
    </Switch>
  </BrowserRouter>,
  document.getElementById('root')
)

if (module.hot) {
  module.hot.accept()
  require('preact/debug')
}
