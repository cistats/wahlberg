import React, { Component } from 'react'

import Menu from 'ui/Menu'

class App extends Component {
  state = { user: this.props.user }

  render() {
    const { user } = this.state

    return <Menu user={user} />
  }
}

export default App
