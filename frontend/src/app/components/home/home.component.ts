import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ArticleService } from 'src/app/services/article.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor(private articleService: ArticleService) { }

  articles: any = [];
  ngOnInit(): void {
    this.showArticles();
  }

  showArticles(){
    this.articles = this.articleService.listArticles().subscribe(article=>{
      this.articles = article;
    });
  }
}
