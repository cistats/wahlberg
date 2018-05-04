import styled, { injectGlobal, css } from 'react-emotion'

injectGlobal`
  * {
    box-sizing: border-box;
  }

  body {
    margin: 0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial,
      sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';
    font-size: 16px;
    line-height: 1.5;
  }

  h1,
  h2,
  h3,
  h4,
  h5,
  h6 {
    margin-top: 0;
    margin-bottom: 0;
    font-weight: 600;
  }

  h1,
  p {
    margin: 0 0 1em 0;
  }

  a {
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }
`

export const Column = styled.div`
  width: 1012px;
  margin-right: auto;
  margin-left: auto;
`

export const PageHeader = styled.h1`
  margin-top: 75px;
  margin-bottom: 0;
  font-weight: 500;
`
