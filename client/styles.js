import styled, { injectGlobal as css } from 'preact-emotion'

css`
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
