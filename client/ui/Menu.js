import React from 'react'
import styled from 'preact-emotion'
import { Link } from 'react-router-dom'

import { Column } from 'styles'

const Background = styled.div`
  background-color: #222;
  color: #eee;
`

const Wrapper = styled.div`
  display: grid;
  grid-template-columns: 1fr 200px;
  padding: 10px 0;
`
const Left = styled.div`font-size: 14px;`
const Right = styled.div`
  font-size: 14px;
  text-align: right;
`

const Logo = styled(Link)`
  margin-right: 30px;
  font-size: 16px;
  font-weight: bold;
  color: #eee;

  :hover {
    text-decoration: none;
  }
`
const MenuLink = styled(Link)`
  margin-left: 30px;
  color: #eee;

  :hover {
    text-decoration: none;
  }
`

const Avatar = styled.img`
  margin: 0 5px;
  height: 20px;
  width: 20px;
  border-radius: 3px;
  vertical-align: bottom;
`

const Menu = ({ user }) => (
  <Background>
    <Column>
      <Wrapper>
        <Left>
          <Logo to="/">BenchMarkyMark</Logo>
          {user ? (
            [
              <MenuLink to="/projects">Projects</MenuLink>,
              <MenuLink to="/team">Team</MenuLink>,
              <MenuLink to="/billing">Billing</MenuLink>,
              <MenuLink to="/settings">Settings</MenuLink>
            ]
          ) : null}
        </Left>
        <Right>
          {user ? (
            <div>
              <Avatar src={user.image} />
              {user.name}
            </div>
          ) : (
            <a href="/login">Login</a>
          )}
        </Right>
      </Wrapper>
    </Column>
  </Background>
)

export default Menu
