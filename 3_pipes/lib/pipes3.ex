defmodule Pipes3 do
  def unique_emails(emails_csv) do
    # downcase = String.downcase(emails_csv)
    # email_list = String.split(downcase, ",")
    # uniq = Enum.uniq(email_list)

    emails_csv
    |> String.downcase()
    |> IO.inspect(label: "Downcased")
    |> String.split(",")
    |> Enum.uniq()
  end
end
