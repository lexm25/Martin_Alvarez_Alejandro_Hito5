import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ShoppingcartService {
  url:string = 'http://localhost:8000';

  constructor(private http: HttpClient) {}

  listCart(){
    return this.http.get<any>(this.url+`/api/shoppingcarts`);
  }

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  addCart(article:any): Observable<any>{
    return this.http.post<any>(this.url+`/api/shoppingcart`,article,this.httpOptions);
  }

  find(id:number): Observable<any>{
    return this.http.get(this.url+`/api/shoppingcart/`+id);
  }

  updateCart(id:number, article:any): Observable<any>{
    return this.http.put(this.url+`/api/shoppingcart/`+id, article, this.httpOptions);
  }

  deleteCart(id: any): Observable<any>{
    return this.http.delete<any>(this.url+`/api/shoppingcart/`+id,this.httpOptions);
  }
}
