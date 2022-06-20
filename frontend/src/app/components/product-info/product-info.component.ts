import { ShoppingcartService } from './../../services/shoppingcart.service';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ArticleService } from 'src/app/services/article.service';

@Component({
  selector: 'app-product-info',
  templateUrl: './product-info.component.html',
  styleUrls: ['./product-info.component.scss']
})
export class ProductInfoComponent implements OnInit {
  articleId: any;
  article: any = [];
  resultado!: string;
  estaLogado!:boolean;
  constructor(private route: ActivatedRoute, private router: Router, private articleService: ArticleService, private shoppingCartService: ShoppingcartService) {
    /* this.articleId = route.snapshot.params['articleId']; */
  }
  articles: any;
  ngOnInit(): void {
    const routeParams = this.route.snapshot.paramMap;
    this.articleId = (routeParams.get('articleId'));

    this.articleService.find(this.articleId).subscribe((data:any)=>{
      this.article = data;
    });

    if(sessionStorage.getItem('rol')=='admin' || sessionStorage.getItem('rol')=='user'){
      this.estaLogado=true;
    }else{
      this.estaLogado=false;
    }
  }

  update(){
    this.articleService.updateArticle(this.articleId, this.article).subscribe((res)=>{
      this.router.navigateByUrl('/articles');
    });
  }

  deleteArticle(id:any){
    this.articleService.deleteArticle(id).subscribe(res=>{
      this.articles = this.articles.filter((a: any)=> a.id == id);
      this.refresh();
    });
  }

  refresh(): void { window.location.reload(); }

  formularioProducto = new FormGroup({
    cantidad: new FormControl('', [Validators.required, Validators.pattern("[0-9]")])
  });

  addCarrito(articleNombre:string, articleFamilia:string, articleUrlImg:string, articleCantidad:string,){
    this.articles = {
      'nombre': articleNombre,
      'familia': articleFamilia,
      'imagen': articleUrlImg,
      'cantidad': articleCantidad
    };
    this.shoppingCartService.addCart(this.articles as any).subscribe(article=>{
      this.articles=article;
      this.router.navigateByUrl('/shopping-cart');
    });
    console.log(this.articles);
  }

  submit() {
    if (this.formularioProducto.valid)
      this.resultado = "Todos los datos son válidos";
    else
      this.resultado = "Hay datos inválidos en el formulario";
  }

}
