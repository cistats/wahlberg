import React from 'react'
import styled from 'preact-emotion'

import { Column } from 'styles'

const Wrapper = styled.div`
  display: grid;
  grid-template-columns: 1fr 200px;
  padding: 10px 0;
  border-bottom: 1px solid #eee;
`
const Left = styled.div`font-size: 14px;`
const Right = styled.div`
  font-size: 14px;
  text-align: right;
`

const Logo = styled.div`
  font-size: 16px;
  font-weight: bold;
`

const Menu = () => (
  <Column>
    <Wrapper>
      <Left>
        <Logo>BenchMarkyMark</Logo>
      </Left>
      <Right>
        <a href="/login">Login</a>
      </Right>
    </Wrapper>
  </Column>
)

export default Menu
