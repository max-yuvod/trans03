# Scripts que corren en cada Flussonic
> Se encuentran en la ruta /etc/flussonic/scripts de cada media server.
> 
> Creados por sys-team. 
>
> Toda documentacion se encuentra en Confluence.


### Scripts:


```
1)  flussonicdailybkp.sh: 
    Realiza un backup del config file flussonic.conf y lo deja en la ruta /etc/flussonic/flussonicdailybkp con la fecha del dia "flussonic-$fecha.conf"
    Este mismo avisa por slack en el canal de #alerts-sys 

2)  copybkptogit.sh: 
    Copia el archivo backupeado anteriormente y lo deja en la raiz del repo de github. 

3)  movebkptofolder.sh: 
    Mueve el archivo copiado en la raiz del repo a la carpeta bkp_configfiles del mismo repo. 

4)  gitrmcheck.sh
    Borra todo archivo .conf que haya en la raiz del repo, esto debido a que el anterior por mas que lo mueva deja la copia en la raiz. 

5)  bkpmaster.sh: 
    Este corre todos los scripts en orden, para no tener que agregar todos en el crontab, se agrego este solo.           
```