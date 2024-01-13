import { Response } from './Response';
import http from '@ohos.net.http';
import { API } from './API';

export function get(url: string,data?: any): Promise<Response> {
  let httpRequest = http.createHttp();
  console.log("http test1"+url)
  console.log("http test1"+data)
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: 15000,
    header: {
      'Content-Type': 'application/json'
    },
    connectTimeout: 15000,
    extraData: data
  });
  let serverData: Response = new Response();
  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === API.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      console.log("http test1"+result);

      let resultJson: Response = JSON.parse(result);
      //console.error("result2"+JSON.stringify(resultJson))
      if (resultJson.errorCode === API.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.errorCode = resultJson.errorCode;
      serverData.errorMsg = resultJson.errorMsg;
    } else {
      serverData.errorMsg = 'error1';
    }
    return serverData;
  }).catch(() => {
    serverData.errorMsg = 'error2';
    return serverData;
  })
}

export function post(url: string, data: any): Promise<Response> {
  let httpRequest = http.createHttp();
  console.log("http test2"+url)

  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.POST,
    readTimeout: 15000,
    header: {
      'Content-Type': 'application/json'
    },
    connectTimeout: 15000,
    extraData: data,
  });

  console.log("http test2"+JSON.stringify(data));
  let serverData: Response = new Response();
  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === API.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      console.log("http test2"+result);

      let resultJson: Response = JSON.parse(result);
      //console.error("result2"+JSON.stringify(resultJson))
      if (resultJson.errorCode === API.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.errorCode = resultJson.errorCode;
      serverData.errorMsg = resultJson.errorMsg;
    } else {
      serverData.errorMsg = 'error1';
    }
    return serverData;
  }).catch(() => {
    serverData.errorMsg = 'error2';
    return serverData;
  })
}