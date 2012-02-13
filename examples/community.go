package main

import "fmt"
import "http"
import "json"
import "io/ioutil"
import "os"

func main() {
	url := "http://api.metagenomics.anl.gov/project/8"
	cl := new(http.Client)
	r, err := cl.Get(url)
	defer r.Body.Close()

	if (err != nil) {
		fmt.Println("aiiieeee!!!")
		fmt.Println(err)
		os.Exit(1)
	}
	if (r.StatusCode != 200) {
		fmt.Println("HTTP request err")
		fmt.Println(fmt.Sprintf("StatusCode=%d", r.StatusCode))
	}
	parsed := make(map [string]interface{}, 20)

	data, err := ioutil.ReadAll(r.Body)
	json.Unmarshal(data, &parsed)

	fmt.Println(parsed)
}
