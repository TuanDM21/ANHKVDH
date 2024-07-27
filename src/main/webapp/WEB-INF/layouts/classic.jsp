<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
    <title><tiles:getAsString name="title" /></title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .main {
            flex: 1;
            display: flex;
        }

        .main-content {
            width: 100%;
        }

        footer {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 5px;
            background-color: #45a1ff;
            color: #fff;
        }
    </style>
</head>

<body>
    <div class="content">
        <div>
            <tiles:insertAttribute name="header" />
        </div>
        <div class="main">
            <div class="main-content">
                <tiles:insertAttribute name="body" />
            </div>
        </div>
        <footer>
            <tiles:insertAttribute name="footer" />
        </footer>
    </div>
</body>
</html>
