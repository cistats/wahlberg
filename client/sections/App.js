import React, { Component } from 'react'
import { Route, Switch } from 'react-router-dom'
import styled from 'react-emotion'

import Menu from 'ui/Menu'
import Projects from 'sections/Projects'

const AppWrapper = styled.div`margin-top: 50px;`

class App extends Component {
  state = { user: this.props.user }

  render() {
    const { user } = this.state

    return (
      <div>
        <Menu user={user} />
        <AppWrapper>
          <Switch>
            <Route exact path="/projects" component={Projects} />
          </Switch>
        </AppWrapper>
      </div>
    )
  }
}

export default App
