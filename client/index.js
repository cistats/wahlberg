import React from 'react'
import { render } from 'react-dom'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

import Home from 'pages/Home'
import App from 'containers/App'

render(
  <BrowserRouter>
    <Switch>
      <Route
        exact
        path="/"
        render={() => <Home user={window.CURRENT_USER} />}
      />
      <Route render={() => <App user={window.CURRENT_USER} />} />
    </Switch>
  </BrowserRouter>,
  document.getElementById('root')
)

if (module.hot) {
  module.hot.accept()
  require('preact/debug')
}
