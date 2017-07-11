import React from 'react'
import { render } from 'react-dom'

render(
  <h1>Bench Marky Mark!</h1>,
  document.getElementById('root')
)

if (module.hot)
  module.hot.accept()
