import React, { Component } from 'react'

import { Column } from 'styles'

class Projects extends Component {
  state = {
    projects: null
  }

  componentWillMount() {
    this.fetchProjects().then(projects => this.setState({ projects }))
  }

  async fetchProjects() {
    const projects = await fetch('/api/repos', { credentials: 'include' })
    return await projects.json()
  }

  render({}, { projects }) {
    return (
      <Column>
        <h1>Projects</h1>
        <pre>{JSON.stringify(projects, null, 2)}</pre>
      </Column>
    )
  }
}

export default Projects
