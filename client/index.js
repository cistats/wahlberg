import React from 'react'
import { render } from 'react-dom'

render(
  <div>
    <h1>
      Bench Marky Mark!
    </h1>
    <a href="/login">Login</a>
  </div>,
  document.getElementById('root')
)

if (module.hot)
  module.hot.accept()
