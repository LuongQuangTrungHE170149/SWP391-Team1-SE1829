<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Autocomplete Example</title>
        <!-- MDB UI Kit CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="form-outline">
                <input type="text" id="search-autocomplete" class="form-control" />
                <label class="form-label" for="search-autocomplete">Search</label>
            </div>
        </div>

        <!-- MDB UI Kit JS -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
        <script type="text/javascript">
            // Import MDB UI Kit components
            const basicAutocomplete = document.querySelector('#search-autocomplete');
            const data = ['One', 'Two', 'Three', 'Four', 'Five'];
            const dataFilter = (value) => {
                return data.filter((item) => {
                    return item.toLowerCase().startsWith(value.toLowerCase());
                });
            };

            new mdb.Autocomplete(basicAutocomplete, {
                filter: dataFilter
            });
        </script>
    </body>
</html>