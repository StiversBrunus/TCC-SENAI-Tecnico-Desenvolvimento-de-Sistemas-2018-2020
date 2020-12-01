import styled from 'styled-components'

export const Preview = styled.div`
    width: 110px;
    height: 110px;
    border-radius: 50%;
    background-image: url(${props => props.src});
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 50% 50%;
    margin-right: 10px;
`;