import React, { Component } from 'react'
import styled from 'preact-emotion'

import { Column, PageHeader } from '../styles'

export const List = styled.div``

export const ListHeader = styled.div`
  padding: 50px 20px 10px;
  font-weight: bold;
  border-bottom: 1px solid #eee;
`
export const ListItem = styled.div`
  background-color: #fafafa;

  &:not(:first-of-type) {
    border-bottom: 1px solid #eee;
  }

  & a {
    position: relative;
    display: block;
    padding: 20px;
    cursor: pointer;

    &:hover {
      background-color: #f2f2f2;
      text-decoration: none;

      &:before {
        content: '»';
        position: absolute;
        right: 20px;
        top: calc(50% - 30px);
        color: #999;
        font-size: 36px;
        font-weight: 300;
      }
    }
  }
`
export const Title = styled.div``
export const SubTitle = styled.div`
  color: #999;
  font-weight: 300;
  font-size: 80%;
`

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
    if (!projects) return <div />

    return (
      <Column>
        <PageHeader>Add a new repository from GitHub:</PageHeader>
        {Object.keys(projects).map(org => (
          <List>
            <ListHeader>{org}</ListHeader>
            {projects[org].map(({ name, description }) => (
              <ListItem>
                <a>
                  <Title>{name}</Title>
                  <SubTitle>{description}</SubTitle>
                </a>
              </ListItem>
            ))}
          </List>
        ))}
      </Column>
    )
  }
}

export default Projects
