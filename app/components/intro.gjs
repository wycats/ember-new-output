import Step from "ember-introjs/components/step";
import Intro from "ember-introjs/components/intro-js";
import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { tracked } from "@glimmer/tracking";

export default class MyIntro extends Component {
  @tracked start = false;
  enableTutorial = () => (this.start = true);
  disableTutorial = () => (this.start = false);

  <template>
    {{#Step step=1 intro="Step Component"}}
      <div class="row">
        <div class="col s12 m6">
          <div class="card blue-grey darken-1">
            {{#Step step=2 intro="Card Content"}}
              <div class="card-content white-text">
                <span class="card-title">Card Title</span>
                <p>I am a very simple card. I am good at containing small bits
                  of information. I am convenient because I require little
                  markup to use effectively.</p>
              </div>
            {{/Step}}
            <div class="card-action">
              <a href="#">This is a link</a>
              <a href="#">This is a link</a>
            </div>
          </div>
        </div>
      </div>
    {{/Step}}

    <button
      class="btn waves-effect waves-light"
      type="submit"
      name="action"
      {{on "click" this.enableTutorial}}
    >Submit
      <i class="material-icons right">Start Tutorial</i>
    </button>

    {{Intro start-if=this.start on-exit=this.disableTutorial}}
  </template>
}
