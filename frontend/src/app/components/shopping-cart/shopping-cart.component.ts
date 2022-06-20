import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ShoppingcartService } from 'src/app/services/shoppingcart.service';

export class Article{
  precio: any;
}

@Component({
  selector: 'app-shopping-cart',
  templateUrl: './shopping-cart.component.html',
  styleUrls: ['./shopping-cart.component.scss']
})
export class ShoppingCartComponent implements OnInit {

  article!: Article;
  esAdmin!: boolean;
  carrito: any = [];
  precio: number = 0;
  constructor(private shoppingCartService: ShoppingcartService, private router: Router) { }

  ngOnInit(): void {
    this.showCart();

  }

  showCart(){
    this.carrito = this.shoppingCartService.listCart().subscribe(article=>{
      this.carrito = article;
      for (let i = 0; i < article.length; i++) {
        this.precio = article[i]['precio'] + this.precio;
      }
    });
  }

  deleteArticle(id:any){
    this.shoppingCartService.deleteCart(id).subscribe(res=>{
      this.carrito = this.carrito.filter((a: any)=> a.id == id);
      this.refresh();
    });
  }

  refresh(): void { window.location.reload(); }

  add(articleNombre:string, articleFamilia:string, articleProcedencia:string, articleUrlImg:string,articleCantidad:string,articlePrecio:string){
    this.carrito = {
      'nombre': articleNombre,
      'familia': articleFamilia,
      'procedencia': articleProcedencia,
      'imagen': articleUrlImg,
      'cantidad': articleCantidad,
      'precio': articlePrecio
    };
    this.shoppingCartService.addCart(this.carrito as any).subscribe(article=>{
      this.carrito=article;
      this.router.navigateByUrl('/carrito');
    });
  }

}
