import { Component, OnInit } from '@angular/core';

import { Router } from '@angular/router';
import { TokenService } from './shared/token.service';
import { AuthStateService } from './shared/auth-state.service';

export class User {
  name: any;
  email: any;
  id:any;
  rol:any;
  telefono:any;
  direccion:any;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit{
  title = 'Exportaciones Sombrerillo';
  isSignedIn!: boolean;
  UserProfile!: User;
  aux!:boolean;
  esAdmin!:boolean;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService
  ) {}
  ngOnInit() {
    console.log(this.UserProfile?.rol);
    this.estaLogeado();
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });
    this.getData();
    console.log(this.esAdmin);
  }
  // Signout
  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['home']);
    sessionStorage.clear();
    this.esAdmin=false;
  }

  estaLogeado(){
    if(sessionStorage.getItem('rol') == '' ||sessionStorage.getItem('rol')==null ||sessionStorage.getItem('rol')=='undefined'){
      this.aux=false;
      this.signOut();
    }
    else if(sessionStorage.getItem('rol')=='admin'){
      this.aux=true;
      this.esAdmin=true;
    }else{
      this.aux=true;
    }
  }

  getData(){
    if(sessionStorage.getItem('rol') == 'admin'){
      this.esAdmin=true;
    }
    else{
      this.esAdmin=false;
    }
  }

  refresh(): void { window.location.reload(); }
}
