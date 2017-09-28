import React from 'react'
import styled from 'preact-emotion'

import { Column } from 'styles'
import Menu from 'ui/Menu'

const Wrapper = styled.div`background-color: #0366d6;`

const Intro = styled(Column)`
  display: grid;
  grid-template-rows: 1fr auto auto 1fr;
  height: 500px;
  color: white;

  & h1 {
    grid-row: 2;
    align-self: center;
    margin: 0;
    font-weight: 400;
  }

  & h3 {
    grid-row: 3;
    align-self: center;
    margin: 0;
    font-weight: 200;
  }
`

const Home = ({ user }) => (
  <Wrapper>
    <Menu user={user} />
    <Intro>
      <h1>
        Fix Performance Problems <em>Before</em> They Happen
      </h1>
      <h3>
        Run benchmarks before you deploy and keep track of performance over
        time.
      </h3>
    </Intro>
  </Wrapper>
)

export default Home
