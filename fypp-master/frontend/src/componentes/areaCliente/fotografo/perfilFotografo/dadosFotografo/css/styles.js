import styled from 'styled-components'

export const Preview = styled.div`
    width: 200px;
    height: 200px;
    border-radius: 50%;
    background-image: url(${props => props.src});
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 50% 50%;
    margin-right: 10px;
    position: absolute;
    margin-top: -8em;
    margin-left: 2em;
`;