import React from 'react'
import { render } from 'react-dom'

import App from './containers/App'

render(<App user={window.CURRENT_USER} />, document.getElementById('root'))

if (module.hot) {
  module.hot.accept()
  require('preact/debug')
}
