import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import styled from 'react-emotion'

import { Column, PageHeader } from '../styles'

export const Grid = styled.div`
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 30px;
`
export const Header = styled.div`
  margin-bottom: 20px;
  padding: 50px 20px 10px;
  font-weight: bold;
  border-bottom: 1px solid #eee;
`
export const GridItem = styled(Link) `
  display: block;
  padding: 20px;
  background-color: #2196f3;
  background-image: linear-gradient(145deg, #2196f3, #26afff);
  border: 1px solid #008eff;
  border-radius: 4px;
  transition: all 0.15s ease;

  &:hover {
    text-decoration: none;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15), 0 1px 5px rgba(0, 0, 0, 0.08);
    transform: scale(1.02);
  }
`
export const Title = styled.div`
  color: white;
  font-weight: 500;
  text-shadow: 0 1px rgba(0, 0, 0, 0.25);
`

class Projects extends Component {
  state = {
    projects: null
  }

  componentWillMount() {
    this.fetchProjects().then(projects => this.setState({ projects }))
  }

  async fetchProjects() {
    const results = await fetch('/api/projects', { credentials: 'include' })
    const projects = await results.json()
    return projects.reduce(
      (projects, project) => ({
        ...projects,
        [project.org]: [...(projects[project.org] || []), project]
      }),
      {}
    )
  }

  render() {
    const { projects } = this.state

    if (!projects) return <div />

    return (
      <Column>
        <PageHeader>Add a new repository from GitHub:</PageHeader>
        {Object.keys(projects).map(org => (
          <div>
            <Header>{org}</Header>
            <Grid>
              {projects[org].map(({ id, repo }) => (
                <GridItem to={`/projects/${repo}`}>
                  <Title>{repo}</Title>
                </GridItem>
              ))}
            </Grid>
          </div>
        ))}
      </Column>
    )
  }
}

export default Projects
