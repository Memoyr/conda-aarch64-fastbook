## Projects utility

Depending on what you need to work on, this folder contains few script to help you fastfoward some configuration.

### setup-conf.sh

Install your custom Jupyter lab config 

``` $ sh setup-conf.sh ```


### setup-conf.sh

Kaggle project setup

```bash
$ cd ../project/
$ sh setup-kaggle.sh  
```

Then export kaggle.json from kaggle account which contain your API token.
Put the file into your /secrets

```bash
$ chmod 600 /secrets/kaggle.json
$ cp /secrets/kaggle.json  ~/.kaggle
$ mkdir /notebooks/your_project_name
 ```

 Now you can use kaggle command, documentation is [here](https://www.kaggle.com/docs/api)

```  kaggle competitions download -c your-compe-name ```
```  unzip -q name-of-folder.zip ```