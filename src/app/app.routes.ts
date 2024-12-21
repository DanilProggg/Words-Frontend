import { Routes } from '@angular/router';
import { DictionaryComponent } from '../modules/dictionary/dictionary.component';
import { PreviewComponent } from '../modules/preview/preview.component';

export const routes: Routes = [
    {
        path: "",
        component: PreviewComponent,
    },
    {
        path: "dictionary",
        component: DictionaryComponent,
        loadChildren: () => import('../modules/dictionary/dictionary.routes').then(m => m.routes)
    },
];
