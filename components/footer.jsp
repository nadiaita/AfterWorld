<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    *{
        margin:0;
        padding: 0;
    }
    footer {
        display: flex;
        height: 200px;
        background-color: grey;
        justify-content: center;
        align-items: center;
        color: white;
        /* position: absolute; */
        bottom: 0;
        width: 100%;
    }
    footer div {
        flex-grow: 3;
        text-align: center;
        padding: 0 3em;
    }
    footer div:last-child{
        flex-grow: 1;
        text-align: right;

    }
    hr{
        margin: 1em 0;
        border: 1px solid ;
    }
    figure{
        margin-top: 1em;
    }
    .card {
        border: 2px solid gray;
        border-radius: 10px;
    }
</style>
<body>
    <footer>
        <div>
            <p>
                Copyright 2020 Afterworld
            </p>
            <hr/>
            <q style="font-style: italic;">Avoiding danger is no safer in the long run than outright exposure. Life is a daring adventure or nothing.</q>
            <figure>- Helen Keller -</figure>
        </div>
        <div>
            <p>
                Stay Connected
            </p>
            <i>Ig</i>
            <i>fb</i>
            <i>twt</i>
            <i>yt</i>
            <p style="margin-top: 1em;">Logged in Users: 0</p>
        </div>
    </footer>
</body>
</html>