### teacher
1. id: number;
2. **name**: string;
3. **gender**: string;
4. **age**: number;
5. **qualification**: string;(全科，小学，初中。。。。)
6. image: string | Resource;
7. subject: string;
8. salary: number;
9. ability: string;(简介)
10. region: string;
11. year: number;(教龄)

### user
1. id: 0
2. name: string = '未登录';
3. password
4. region: string = '无'
5. email: string = '无';
6. imagePath: string | Resource = $rawfile('user/head.png');
7. price: number = 0

### order
1. user_id
2. teacher_id
3. time
4. during(时长)
5. price

```ts
(error, data) => {
if(error) {
console.log("http error code: " + error.code + ", msg: " + error.message)
} else {
let code = data.responseCode
if(ResponseCode.ResponseCode.OK == code) {
let html = JSON.stringify(data.result);
html = html.replace(/\\/g, "");
html = html.slice(1,html.length-1);
console.log("httpresult: " + html);


              teacherList = JSON.parse(JSON.stringify(html));
              console.log("httpresult: " + JSON.stringify(teacherList));
              let header= JSON.stringify(data.header);
              console.log("httpheader: " + header);
            } else {
              console.log("http response code: " + code);
            }
          }
        }
``` 


